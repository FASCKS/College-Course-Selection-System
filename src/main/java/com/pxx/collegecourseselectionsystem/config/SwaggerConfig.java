package com.pxx.collegecourseselectionsystem.config;

import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.*;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * http://localhost:8080/swagger-ui/index.html
 */
@Configuration
@EnableWebMvc
@ConditionalOnExpression("${swagger.enable}") //开启访问接口文档的权限  **swagger.enable是在yml配置文件中配置为true**
public class SwaggerConfig {
    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.pxx.collegecourseselectionsystem.controller"))
                .paths(PathSelectors.any())
                .build()
                .securitySchemes(Arrays.asList(new ApiKey("access_token", "access_token", "header")))
                .securityContexts(Arrays.asList(SecurityContext.builder()
                        .securityReferences(Arrays.asList(SecurityReference.builder()
                                .reference("access_token")
                                .scopes(new AuthorizationScope[]{new AuthorizationScope("global", "accessEverything")})
                                .build()))
                        .build()))

                ;
    }


    private List<SecurityReference> defaultAuth() {
        AuthorizationScope authorizationScope = new AuthorizationScope("global", "accessEverything");
        AuthorizationScope[] authorizationScopes = new AuthorizationScope[1];
        authorizationScopes[0] = authorizationScope;
        List<SecurityReference> securityReferences = new ArrayList<>();
        securityReferences.add(new SecurityReference("Authorization", authorizationScopes));
        return securityReferences;
    }


    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("后台系统")
                .description("")
                .termsOfServiceUrl("")
                .contact(new Contact("pxx", "123", "111"))
                .version("1.0")
                .build();
    }
}
