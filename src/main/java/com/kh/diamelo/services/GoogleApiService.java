// com.kh.diamelo.service 패키지에 속한 클래스임을 선언합니다.
package com.kh.diamelo.services;

// JSON 처리와 관련된 클래스 및 예외 처리를 위한 라이브러리를 임포트합니다.

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

// @Service 애너테이션을 통해 이 클래스가 Spring의 서비스 컴포넌트임을 선언합니다.
@Service
public class GoogleApiService {

    // 외부 설정 (properties, yaml 등)에서 구글 로그인 API의 클라이언트 아이디 값을 주입받습니다.
    @Value("${google.login-api.client-id}")
    private String googleLoginApiClientId;

    // 외부 설정에서 구글 로그인 API의 리다이렉트 URL 값을 주입받습니다.
    @Value("${google.login-api.redirect-url}")
    private String googleLoginApiRedirectUrl;

    // 외부 설정에서 구글 로그인 API의 클라이언트 시크릿 값을 주입받습니다.
    @Value("${google.login-api.client-secret}")
    private String googleLoginApiClientSecret;

    /**
     * 인가코드를 통해 구글 API로부터 사용자의 이메일을 요청하는 메서드입니다.
     * @param code 사용자가 구글 로그인 후 받은 인가코드
     * @return 구글 계정과 연동된 이메일 주소
     */
    public String requestGoogleEmail(String code) {
        // 인가코드를 사용하여 구글 토큰을 요청하고, 응답 받은 JSON 문자열을 tokenResponse에 저장합니다.
        String tokenResponse = requestGetGoogleToken(code);
        // 토큰 응답값을 콘솔에 출력합니다.
        System.out.println("tokenResponse : " + tokenResponse);

        // 토큰 응답에서 access_token 값을 추출합니다.
        String accessToekn = extractAccessToken(tokenResponse);

        // 추출한 access_token을 사용해 구글에서 사용자 정보를 가져옵니다.
        String userInfoResponse = getUserInfo(accessToekn);

        // 사용자 정보 JSON에서 이메일 값을 추출합니다.
        String email = extractUserEmail(userInfoResponse);

        // 최종적으로 구글 계정의 이메일을 반환합니다.
        return email;
    }

    /**
     * 구글 사용자 정보 API를 호출하여 사용자 정보를 가져옵니다.
     * @param accessToken 구글 토큰 API에서 발급받은 access_token
     * @return 사용자 정보가 포함된 JSON 문자열
     */
    private String getUserInfo(String accessToken) {
        // 구글의 사용자 정보 API URL (userinfo endpoint)
        String url = "https://www.googleapis.com/oauth2/v3/userinfo";

        // HTTP 헤더 객체를 생성하고, Authorization 헤더에 Bearer 토큰 형식으로 accessToken을 설정합니다.
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + accessToken);

        // 헤더를 포함하는 HTTP 요청 엔티티를 생성합니다. (GET 요청의 경우 본문은 필요하지 않습니다.)
        HttpEntity<String> entity = new HttpEntity<>(headers);

        // RestTemplate 객체를 생성하여 HTTP 요청을 보낼 준비를 합니다.
        RestTemplate restTemplate = new RestTemplate();

        // RestTemplate의 exchange() 메서드를 이용해 GET 요청을 보내고 응답을 받아옵니다.
        ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);

        // 응답 본문(body)은 JSON 문자열 형태로 반환되며 이를 리턴합니다.

        System.out.println(responseEntity.getBody());
        return responseEntity.getBody();
    }

    /**
     * 구글 토큰 API 응답 JSON에서 access_token 값을 추출합니다.
     * @param tokenResponse 구글 토큰 API로부터 받은 JSON 응답 문자열
     * @return 추출된 access_token 문자열, 실패 시 null
     */
    private String extractAccessToken(String tokenResponse) {
        // JSON 문자열을 파싱하기 위해 ObjectMapper 객체를 생성합니다.
        ObjectMapper mapper = new ObjectMapper();

        try {
            // tokenResponse를 JsonNode 객체로 변환합니다.
            JsonNode jsonNode = mapper.readTree(tokenResponse);
            // "access_token" 필드의 값을 추출하여 텍스트 형태로 반환합니다.
            return jsonNode.get("access_token").asText();
        } catch (JsonProcessingException e) {
            // JSON 파싱 중 오류가 발생하면 예외 스택 트레이스를 출력하고 null을 반환합니다.
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 구글 사용자 정보 JSON에서 이메일 정보를 추출합니다.
     * @param userInfoResponse 구글 사용자 정보 API 응답 JSON 문자열
     * @return 사용자 이메일 문자열, 실패 시 null
     */
    private String extractUserEmail(String userInfoResponse) {
        // JSON 파싱을 위한 ObjectMapper 객체 생성
        ObjectMapper mapper = new ObjectMapper();

        try {
            // userInfoResponse를 JsonNode 객체로 변환합니다.
            JsonNode jsonNode = mapper.readTree(userInfoResponse);
            // "email" 필드의 값을 텍스트 형태로 추출하여 반환합니다.
            return jsonNode.get("email").asText();
        } catch (JsonProcessingException e) {
            // JSON 파싱 오류 발생 시 예외 스택 트레이스를 출력하고 null 반환
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 인가코드를 기반으로 구글 토큰 API에 POST 요청을 보내 access_token을 받아오는 메서드입니다.
     * @param code 구글 로그인 후 전달받은 인가코드
     * @return 토큰 응답 JSON 문자열, 실패 시 null
     */
    private String requestGetGoogleToken(String code) {
        // 구글 토큰 발급 API의 URL
        String url = "https://oauth2.googleapis.com/token";

        // 요청 파라미터를 URL 인코딩된 문자열 형태로 구성합니다.
        // 여기에는 인가코드, grant_type, client_id, client_secret, redirect_uri 값이 포함됩니다.
        String params = "code=" + code + "&grant_type=authorization_code"
                + "&client_id=" + googleLoginApiClientId
                + "&client_secret=" + googleLoginApiClientSecret
                + "&redirect_uri=" + googleLoginApiRedirectUrl;

        // HTTP 헤더 객체를 생성하고 Content-Type 헤더를 form 데이터 전송에 적합한 application/x-www-form-urlencoded로 설정합니다.
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED); // 폼 타입 요청

        // 파라미터와 헤더를 포함한 HTTP 요청 엔티티를 생성합니다.
        HttpEntity<String> entity = new HttpEntity<>(params, headers);

        // RestTemplate 객체를 생성하여 HTTP 통신을 수행할 준비를 합니다.
        RestTemplate restTemplate = new RestTemplate();

        // RestTemplate의 exchange() 메서드를 사용하여 POST 요청을 보내고 응답을 받아옵니다.
        ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);

        return responseEntity.getBody();
    }
}