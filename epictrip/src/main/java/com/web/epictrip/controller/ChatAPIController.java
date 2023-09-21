package com.web.epictrip.controller;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.web.epictrip.vo.Question;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

@RestController
public class ChatAPIController {

    @Value("${openai.api.key}")
    private String API_KEY;

    private static final String API_URL = "https://api.openai.com/v1/engines/davinci/completions";
    private final OkHttpClient client = new OkHttpClient();

    @PostMapping("/ask")
    public ResponseEntity<String> askGPT(@RequestBody Question questionObj) {
        String question = questionObj.getQuestion();

        try {
            MediaType json = MediaType.parse("application/json; charset=utf-8");
            String requestBodyContent = "{ \"prompt\": \"" + question + "\", \"max_tokens\": 150 }";
            okhttp3.RequestBody body = okhttp3.RequestBody.Companion.create(requestBodyContent, json);

            Request request = new Request.Builder()
                    .url(API_URL)
                    .post(body)
                    .addHeader("Authorization", "Bearer " + API_KEY)
                    .addHeader("Content-Type", "application/json")
                    .build();

            try (Response response = client.newCall(request).execute()) {
                if (!response.isSuccessful()) {
                    return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                            .body("API 호출 실패: " + response.code());
                } else {
                    String responseBody = response.body().string();
                    JSONObject jsonResponse = new JSONObject(responseBody);
                    String answer = jsonResponse.getJSONArray("choices").getJSONObject(0).getString("text");
                    return ResponseEntity.ok(answer.trim());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred: " + e.getMessage());
        }
    }
}
