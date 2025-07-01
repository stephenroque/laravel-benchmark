#!/bin/bash

OUTPUT_FILE="benchmark.txt"

echo "🚀 Starting Benchmarks - $(date)" > $OUTPUT_FILE

# --- Server on Port 9801 (OpenSwoole) ---
echo -e "\n\n--- 📊 Results for OpenSwoole (Port 9801) ---\n" >> $OUTPUT_FILE
echo "Endpoint: /api/health-check" >> $OUTPUT_FILE
wrk -t16 -c100 -d30s --latency http://127.0.0.1:9801/api/health-check >> $OUTPUT_FILE
echo "Endpoint: /api/static" >> $OUTPUT_FILE
wrk -t16 -c100 -d30s --latency http://127.0.0.1:9801/api/static >> $OUTPUT_FILE
echo "Endpoint: /api/http-request" >> $OUTPUT_FILE
wrk -t16 -c100 -d30s --latency http://127.0.0.1:9801/api/http-request >> $OUTPUT_FILE

# --- Server on Port 9802 (Swoole) ---
echo -e "\n\n--- 📊 Results for Swoole (Port 9802) ---\n" >> $OUTPUT_FILE
echo "Endpoint: /api/health-check" >> $OUTPUT_FILE
wrk -t16 -c100 -d30s --latency http://127.0.0.1:9802/api/health-check >> $OUTPUT_FILE
echo "Endpoint: /api/static" >> $OUTPUT_FILE
wrk -t16 -c100 -d30s --latency http://127.0.0.1:9802/api/static >> $OUTPUT_FILE
echo "Endpoint: /api/http-request" >> $OUTPUT_FILE
wrk -t16 -c100 -d30s --latency http://127.0.0.1:9802/api/http-request >> $OUTPUT_FILE

# --- Server on Port 9803 (RoadRunner) ---
echo -e "\n\n--- 📊 Results for RoadRunner (Port 9803) ---\n" >> $OUTPUT_FILE
echo "Endpoint: /api/health-check" >> $OUTPUT_FILE
wrk -t16 -c100 -d30s --latency http://127.0.0.1:9803/api/health-check >> $OUTPUT_FILE
echo "Endpoint: /api/static" >> $OUTPUT_FILE
wrk -t16 -c100 -d30s --latency http://127.0.0.1:9803/api/static >> $OUTPUT_FILE
echo "Endpoint: /api/http-request" >> $OUTPUT_FILE
wrk -t16 -c100 -d30s --latency http://127.0.0.1:9803/api/http-request >> $OUTPUT_FILE

# --- Server on Port 9804 (FrankenPHP) ---
echo -e "\n\n--- 📊 RResults for FrankenPHP (Port 9804) ---\n" >> $OUTPUT_FILE
echo "Endpoint: /api/health-check" >> $OUTPUT_FILE
wrk -t16 -c100 -d30s --latency http://127.0.0.1:9804/api/health-check >> $OUTPUT_FILE
echo "Endpoint: /api/static" >> $OUTPUT_FILE
wrk -t16 -c100 -d30s --latency http://127.0.0.1:9804/api/static >> $OUTPUT_FILE
echo "Endpoint: /api/http-request" >> $OUTPUT_FILE
wrk -t16 -c100 -d30s --latency http://127.0.0.1:9804/api/http-request >> $OUTPUT_FILE

# --- Server on Port 9805 (PHP-FPM by Nginx) ---
echo -e "\n\n--- 📊 Results for PHP-FPM (Port 9805) ---\n" >> $OUTPUT_FILE
echo "Endpoint: /api/health-check" >> $OUTPUT_FILE
wrk -t16 -c100 -d30s --latency http://127.0.0.1:9805/api/health-check >> $OUTPUT_FILE
echo "Endpoint: /api/static" >> $OUTPUT_FILE
wrk -t16 -c100 -d30s --latency http://127.0.0.1:9805/api/static >> $OUTPUT_FILE
echo "Endpoint: /api/http-request" >> $OUTPUT_FILE
wrk -t16 -c100 -d30s --latency http://127.0.0.1:9805/api/http-request >> $OUTPUT_FILE

echo -e "\n\n✅ Benchmarks completed! Results saved in $OUTPUT_FILE"