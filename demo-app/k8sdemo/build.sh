export BACKEND_URL=https://api.nasa.gov/planetary/apod\?api_key\=DEMO_KEY


docker build -t niklaushirt/k8sdemo:1.0.1 .
docker push niklaushirt/k8sdemo:1.0.1