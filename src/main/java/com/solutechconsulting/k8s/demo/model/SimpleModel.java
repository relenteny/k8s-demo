package com.solutechconsulting.k8s.demo.model;

public class SimpleModel {
    private String modelProperty;
    private String message;

    public SimpleModel(String modelProperty, String message) {
        this.modelProperty = modelProperty;
        this.message = message;
    }

    public String getMessage() {
        return modelProperty + ": " + message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
