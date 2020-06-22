https://github.com/loadimpact/k6



kubectl create -f ~/training/deployment/demoapp.yaml
kubectl create -f ~/training/deployment/demoapp-service.yaml
kubectl create -f ~/training/deployment/demoapp-backend.yaml
kubectl create -f ~/training/deployment/demoapp-backend-service.yaml

docker pull niklaushirt/grpc-api:1.0.0
docker pull niklaushirt/grpc-server:1.0.0
docker pull niklaushirt/grpcdemo:1.0.0




firefox http://192.168.39.52:32123
firefox http://localhost:8089

sudo sysctl -w vm.max_map_count=262144
ulimit -n 65535

sudo apt install python3-pip
pip3 install locust


import random
from locust import HttpUser, task, between

class QuickstartUser(HttpUser):
    wait_time = between(0, 1)

    @task
    def index_page(self):
        response = self.client.get("/")
        print("Response status code:", response.status_code)



locust -f locust.py






sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61
echo "deb https://dl.bintray.com/loadimpact/deb stable main" | sudo tee -a /etc/apt/sources.list
sudo apt-get update
sudo apt-get install k6

sudo snap install k6


kubectl create -f ~/training/deployment/demoapp.yaml
kubectl create -f ~/training/deployment/demoapp-service.yaml
kubectl create -f ~/training/deployment/demoapp-backend.yaml
kubectl create -f ~/training/deployment/demoapp-backend-service.yaml





http://192.168.39.52:32123/
perf.js                                                          

import http from "k6/http";

export default function() {
    let response = http.get("http://192.168.39.52:32123/");
};


import http from "k6/http";
import { check, group } from "k6";

export default function () {
    group("Static Assets", function () {
        check(http.get("http://192.168.39.52:32123/"), {
            "status is 200": (r) => r.status == 200,
        });
    });
}


import http from "k6/http";
import { check, group } from "k6";

export default function () {
    group("Static Assets", function () {
        check(http.get("http://192.168.39.52:32123/"), {
            "status is 200": (r) => r.status == 200,
            "protocol is HTTP/2": (r) => r.proto == "HTTP/2.0",
        });
    });
}


k6 run --vus 10 --iterations 1000 perf.js

stages.js
export let options = {
    vus: 5,
    stages: [
        { duration: "3m", target: 10 },
        { duration: "5m", target: 10 },
        { duration: "10m", target: 35 },
        { duration: "1m30s", target: 0 },
    ]
};






k6 run --stage stages.js perf.js




import http from "k6/http";
import { check, group, sleep } from "k6";
import { Rate } from "k6/metrics";

// A custom metric to track failure rates
var failureRate = new Rate("check_failure_rate");

// Options
export let options = {
    stages: [
        // Linearly ramp up from 1 to 50 VUs during first minute
        { target: 50, duration: "1m" },
        // Hold at 50 VUs for the next 3 minutes and 30 seconds
        { target: 50, duration: "3m30s" },
        // Linearly ramp down from 50 to 0 50 VUs over the last 30 seconds
        { target: 0, duration: "30s" }
        // Total execution time will be ~5 minutes
    ],
    thresholds: {
        // We want the 95th percentile of all HTTP request durations to be less than 500ms
        "http_req_duration": ["p(95)<500"],
        // Requests with the staticAsset tag should finish even faster
        "http_req_duration{staticAsset:yes}": ["p(99)<250"],
        // Thresholds based on the custom metric we defined and use to track application failures
        "check_failure_rate": [
            // Global failure rate should be less than 1%
            "rate<0.01",
            // Abort the test early if it climbs over 5%
            { threshold: "rate<=0.05", abortOnFail: true },
        ],
    },
};

// Main function
export default function () {
    let response = http.get("https://test.loadimpact.com/");

    // check() returns false if any of the specified conditions fail
    let checkRes = check(response, {
        "http2 is used": (r) => r.proto === "HTTP/2.0",
        "status is 200": (r) => r.status === 200,
        "content is present": (r) => r.body.indexOf("Welcome to the LoadImpact.com demo site!") !== -1,
    });

    // We reverse the check() result since we want to count the failures
    failureRate.add(!checkRes);

    // Load static assets, all requests
    group("Static Assets", function () {
        // Execute multiple requests in parallel like a browser, to fetch some static resources
        let resps = http.batch([
            ["GET", "https://test.loadimpact.com/style.css", null, { tags: { staticAsset: "yes" } }],
            ["GET", "https://test.loadimpact.com/images/logo.png", null, { tags: { staticAsset: "yes" } }]
        ]);
        // Combine check() call with failure tracking
        failureRate.add(!check(resps, {
            "status is 200": (r) => r[0].status === 200 && r[1].status === 200,
            "reused connection": (r) => r[0].timings.connecting == 0,
        }));
    });

    sleep(Math.random() * 3 + 2); // Random sleep between 2s and 5s
}

