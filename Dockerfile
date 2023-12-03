# Container image that runs your code
FROM pandoc/latex:3.1.1-alpine

# Install Python 3 and pip
RUN apk add --no-cache python3 py3-pip

# Install panflute using pip
RUN pip3 install panflute

LABEL maintainer='Matthias Schmid <mail@matthias-schmid.de>'
