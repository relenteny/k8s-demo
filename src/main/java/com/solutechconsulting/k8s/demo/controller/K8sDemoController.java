package com.solutechconsulting.k8s.demo.controller;

import com.solutechconsulting.k8s.demo.model.SimpleModel;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class K8sDemoController {
    @Value("${model.property}")
    private String modelProperty;

    @GetMapping("/ws-test")
    public SimpleModel simpleTest() {
        return new SimpleModel(modelProperty, "A super simple REST API.");
    }
}
