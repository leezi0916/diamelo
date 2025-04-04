package com.kh.diamelo.services;


import com.kh.diamelo.mappers.BuyMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class BuyServiceImpl implements BuyService {
    private final BuyMapper buyMapper;

    @Override
    public int selectBuyCount() {
        return buyMapper.selectBuyCount();
    }
}
