FROM python:3.11

WORKDIR /usr/src/app

# set environment variables, DO NOT USE IN PROD, use docker secrets
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DB_URL postgresql://postgres:b!q>pTv{S?Fg[97c*8;=KA@indibook.cro3bezfywfu.ap-south-1.rds.amazonaws.com:5432/indibook
ENV AWS_ACCESS_KEY_ID AKIA6MU3VYSUCICOYZXE
ENV AWS_SECRET_ACCESS_KEY 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
ENV S3_BUCKET_NAME indibook-db
ENV OUTPUT_DIR src/indibook/output/
ENV SENDGRID_API_KEY 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
ENV FCM_CREDENTIAL_PATH src/indibook/configurator/resources/tokens/notifications-coins91-firebase-adminsdk-owpcu-08249e7ebc.json
ENV PG_CONFIG_MOBILE_PATH src/indibook/configurator/resources/tokens/worldline_configuration_mobile.json
ENV AUTH_TOKEN_SECRET EFif54nmi54
ENV TOKEN_EXPIRY_TIME 36000000000
ENV TOKEN_ALGORITHM HS256
ENV AUTH_API https://api.indibook.in/v1/auth/verify_token
ENV CRM_API_URL https://indibook.internovo.in
ENV CRM_API_KEY icnkfe
ENV SMS_API_KEY dk49cxoefkjni3ep3
ENV API_KEY_EMAIL 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
ENV API_URL_EMAIL https://api.brevo.com/v3/smtp/email


# copy requirements file
COPY ./requirements.txt /usr/src/app/requirements.txt

# install dependencies
RUN pip install -r /usr/src/app/requirements.txt

# install wkhtmltopdf
RUN apt-get update && apt-get install -y wkhtmltopdf 
# copy project
COPY . /usr/src/app/

#CMD uvicorn src.indibook.adapters.entrypoints.application:app --host ${HOST} --port ${PORT}
