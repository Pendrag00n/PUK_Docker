FROM sebp/elk:latest

# Copy your custom Logstash configuration
COPY logstash.conf /etc/logstash/conf.d/logstash.conf

# Ensure the log directories exist
RUN mkdir -p /var/log/cowrie
