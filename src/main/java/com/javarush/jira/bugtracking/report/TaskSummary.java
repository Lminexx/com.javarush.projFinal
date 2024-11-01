package com.javarush.jira.bugtracking.report;

import lombok.Data;


public record TaskSummary(String status, long total) {
}
