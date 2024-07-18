# https://strimzi.io/quickstarts/

# Create namespace
kubectl create namespace kafka

# Install Strimzi
kubectl create -f 'https://strimzi.io/install/latest?namespace=kafka' -n kafka

# Watch pods
kubectl get pod -n kafka --watch

# Watch logs
kubectl logs deployment/strimzi-cluster-operator -n kafka -f

# Apply the `Kafka` Cluster CR file
kubectl apply -f https://strimzi.io/examples/latest/kafka/kraft/kafka-single-node.yaml -n kafka

# Wait for the Kafka cluster to be ready
kubectl wait kafka/my-cluster --for=condition=Ready --timeout=300s -n kafka

# Send message
kubectl -n kafka run kafka-producer -ti --image=quay.io/strimzi/kafka:0.42.0-kafka-3.7.1 --rm=true --restart=Never -- bin/kafka-console-producer.sh --bootstrap-server my-cluster-kafka-bootstrap:9092 --topic my-topic

# Receive message
kubectl -n kafka run kafka-consumer -ti --image=quay.io/strimzi/kafka:0.42.0-kafka-3.7.1 --rm=true --restart=Never -- bin/kafka-console-consumer.sh --bootstrap-server my-cluster-kafka-bootstrap:9092 --topic my-topic --from-beginning
