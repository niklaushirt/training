export BACKEND_URL=https://api.nasa.gov/planetary/apod\?api_key\=DEMO_KEY


docker build -t niklaushirt/k8sdemo:1.0.0 .
docker push niklaushirt/k8sdemo:1.0.0




docker build -t niklaushirt/k8sdemo:1.0.1 .
docker push niklaushirt/k8sdemo:1.0.1



docker run niklaushirt/k8sdemo:1.0.1 --rm -d -p 3000:3000

