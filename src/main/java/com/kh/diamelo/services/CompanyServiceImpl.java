package com.kh.diamelo.services;

import com.kh.diamelo.mappers.CompanyMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class CompanyServiceImpl implements CompanyService {
    private final CompanyMapper companyMapper;
}
