FROM alpine:latest

# Install bash, git, and text utilities
RUN apk add --no-cache bash git gawk sed

WORKDIR /app

# Copy script into the container
COPY parser.sh .

# Make script executable
RUN chmod u+x parser.sh

# Run script by default
ENTRYPOINT ["/app/parser.sh"]
