
cd k8sdemo
docker build -t k8sdemo:1.0.1 .
docker push k8sdemo:1.0.1

cd ..
cd k8sdemo_backend
docker build -t k8sdemo-backend:1.0.0 .
docker push k8sdemo-backend:1.0.0