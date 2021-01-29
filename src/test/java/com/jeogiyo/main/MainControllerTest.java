package com.jeogiyo.main;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(MainController.class)
class MainControllerTest {
    @Autowired
    private MockMvc mvc;

    @Test
    @DisplayName("/main/main request")
    void test() throws Exception{
        ResultActions actions=mvc.perform(get("/main/main")
                .contentType("text/html"))
                .andDo(print());
        actions.andExpect(status().isOk());
    }
}