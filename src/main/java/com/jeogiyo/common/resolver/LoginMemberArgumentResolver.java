package com.jeogiyo.common.resolver;

import com.jeogiyo.common.annotation.LoginMember;
import com.jeogiyo.member.dto.SessionMember;
import javax.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

/**
 * Created by IntelliJ IDEA
 * User: hojun
 * Date: 2021-06-20 Time: 오후 8:13
 */

@RequiredArgsConstructor
@Component
public class LoginMemberArgumentResolver implements HandlerMethodArgumentResolver {

    private final HttpSession httpSession;

    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        boolean isLoginMemberAnnotation =
                parameter.getParameterAnnotation(LoginMember.class) != null;
        boolean isMemberClass = SessionMember.class.equals(parameter.getParameterType());
        return isLoginMemberAnnotation && isMemberClass;
    }

    @Override
    public Object resolveArgument(MethodParameter parameter
            , ModelAndViewContainer mavContainer
            , NativeWebRequest webRequest
            , WebDataBinderFactory binderFactory) throws Exception {
        return httpSession.getAttribute("memberInfo");
    }
}
