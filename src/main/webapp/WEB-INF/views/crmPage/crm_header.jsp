<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 25. 3. 25.
  Time: 오후 2:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/crm/crm_header.css" />
<head>
    <title>Title</title>
</head>
<body>
<div id="header">
    <div id="logo">
        <img src="/resources/project_image/logo.png" alt="로고이미지" onclick="location.href='${pageContext.servletContext.contextPath}'">
    </div>
    <div id="category">
        <div>
            <a href="">스킨</a>
        </div>
        <div>
            <a href="">로션</a>
        </div>
        <div>
            <a href="">선크림</a>
        </div>
        <div>
            <a href="">미용</a>
        </div>
    </div>
    <div id="other">
        <div id="icon">
            <div>
                <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg" onclick="location.href='${pageContext.servletContext.contextPath}'">
                    <g clip-path="url(#clip0_38_5769)">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M32.5332 32.3193C30.8398 26.9643 26.2898 23.896 20.0448 23.896H19.9998C13.7382 23.861 9.16482 26.951 7.46815 32.3193L7.27148 32.9427L7.82815 33.2827C11.0915 35.2727 15.1615 36.281 19.9215 36.281C19.9748 36.281 20.0282 36.281 20.0798 36.281C24.9065 36.281 28.8632 35.2993 32.1732 33.2827L32.7298 32.9427L32.5332 32.3193Z" fill="#7AC38F"/>
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M20.0007 20.1824C24.539 20.1824 28.2324 16.4907 28.2324 11.9524C28.2324 7.41237 24.539 3.7207 20.0007 3.7207C15.4624 3.7207 11.7707 7.41237 11.7707 11.9524C11.7707 16.4907 15.4624 20.1824 20.0007 20.1824Z" fill="#7AC38F"/>
                    </g>
                    <defs>
                        <clipPath id="clip0_38_5769">
                            <rect width="40" height="40" fill="white"/>
                        </clipPath>
                    </defs>
                </svg>

            </div>
            <div>
                <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" onclick="location.href='${pageContext.servletContext.contextPath}'">
                    <g clip-path="url(#clip0_38_5771)">
                        <rect width="40" height="40" fill="url(#pattern0_38_5771)"/>
                    </g>
                    <defs>
                        <pattern id="pattern0_38_5771" patternContentUnits="objectBoundingBox" width="1" height="1">
                            <use xlink:href="#image0_38_5771" transform="scale(0.0104167)"/>
                        </pattern>
                        <clipPath id="clip0_38_5771">
                            <rect width="40" height="40" fill="white"/>
                        </clipPath>
                        <image id="image0_38_5771" width="96" height="96" preserveAspectRatio="none" xlink:href="data:image/png;base64,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"/>
                    </defs>
                </svg>
            </div>
            <div>
                <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" onclick="location.href='${pageContext.servletContext.contextPath}'">
                    <rect width="40" height="40" fill="url(#pattern0_247_2095)"/>
                    <defs>
                        <pattern id="pattern0_247_2095" patternContentUnits="objectBoundingBox" width="1" height="1">
                            <use xlink:href="#image0_247_2095" transform="scale(0.0104167)"/>
                        </pattern>
                        <image id="image0_247_2095" width="96" height="96" preserveAspectRatio="none" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAYAAADimHc4AAAACXBIWXMAAAsTAAALEwEAmpwYAAACHElEQVR4nO2ZMW4UQRBFKzBnwVyMO8yXJV/Ano65CISgaTsjMycBZw6MVoLQ0xK9o/q1vCdNWNLv/7uqdtURAAAAAAAAAAAAb3DzrX1Qb+uytR/q7Vm9vZp/z9rWp6Wv98vj3XXZYD9+//Ru2da29PZiYOrrv3wn7acgbr/eXkU189Xbl2wDda4gtvVzqRBONz/bNJ29G9b7qDLzK48dvRlAe7l5aO/DnUu8/fr7be0u3Pnza+dCA1ifwp2lr78uuAN+hjujQ4Q5Kq6//AFUXH/5A6i4/vIHUHH95Q+g4vrLH0DF9Zc/gIrrL38AFdc/fQD3erm/N7gbGJP19u8N7gbGZL39e4O7gTFZb//e4G5g2AZwpvcGdwNjst7+vcHdwLAO4AzvDe4GhncHzL83zBqQjQ7Wf7g/BLAPAQygA5IRI4gApmAH7MMOGMAISkb/+w5wr1eyviHZAkUA3gbGZH22viHZAkUA3gbGZH22viHZAkUA3gbGZH22viHZAkUAByd8MEffUPsOyEYEQABT0AH7MIIGMIKSETuAAKZgBxTfAe714p/wPgRgfoNjsj5b35BsgSIAbwNjsj5b35BsgSIAbwNjsj5b35BsgSKAgxM+mKNvqH0HZCMCIIAp6IB9GEEDGEHJiB1AAFOwA8x3AF8jABlfBDqgE0D6LRQdkG+EGEH5ZijhYwd0Aki/harcAQAAAAAAAAAAEJfCb56WfSxdif/wAAAAAElFTkSuQmCC"/>
                    </defs>
                </svg>

            </div>
            <div>
                <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg" onclick="location.href='${pageContext.servletContext.contextPath}'">
                    <g clip-path="url(#clip0_38_5773)">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M30.3846 12.7743L28.6212 14.546L32.8446 18.7493H22.5079V21.2493H32.8446L28.6212 25.456L30.3862 27.2277L37.6446 19.9993L30.3846 12.7743Z" fill="#7AC38F"/>
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M12.0753 18.75L22.5079 18.7493L22.5086 3.75H3.30859V36.25H22.5086L22.5079 21.2493L12.0753 21.25V18.75Z" fill="#7AC38F"/>
                    </g>
                    <defs>
                        <clipPath id="clip0_38_5773">
                            <rect width="40" height="40" fill="white"/>
                        </clipPath>
                    </defs>
                </svg>

            </div>
        </div>
        <div id="button">
            <a href=""><button>전체 상품</button></a>
        </div>
    </div>
</div>


</body>
</html>
