

package com.capstone2.dichomuadich.configs;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;


/**
 * TODO: Class descriptionF
 */
@Configuration
public class WebMvcConfig extends WebMvcConfigurationSupport {
    /*
     *  @Bean
     * public OpenEntityManagerInViewFilter meatboxOpenEntityManagerInViewFilter() {
     *    OpenEntityManagerInViewFilter osivFilter = new OpenEntityManagerInViewFilter();
     *    osivFilter.setEntityManagerFactoryBeanName("bookEntityManager");
     *    return osivFilter;
     * }
     */


    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/WEB-INF/resources/");
        registry.addResourceHandler("/libraries/**").addResourceLocations("/WEB-INF/libraries/");

        registry.addResourceHandler("swagger-ui.html").addResourceLocations("classpath:/META-INF/resources/");

        registry.addResourceHandler("/webjars/**").addResourceLocations("classpath:/META-INF/resources/webjars/");
    }

    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        TilesViewResolver viewResolver = new TilesViewResolver();
        registry.viewResolver(viewResolver);
    }

    /**
     * TODO: Method description
     *
     * @return
     */
    @Bean
    public MultipartResolver multipartResolver() {
        CommonsMultipartResolver resover = new CommonsMultipartResolver();
        return resover;

    }

    /**
     * TODO: Method description
     *
     * @return
     */
    @Bean
    public TilesConfigurer tilesConfigurer() {
        TilesConfigurer tilesConfigurer = new TilesConfigurer();
        tilesConfigurer.setDefinitions(new String[]{"/WEB-INF/templates/tiles-public.xml"});
        tilesConfigurer.setCheckRefresh(true);
        return tilesConfigurer;
    }


}

