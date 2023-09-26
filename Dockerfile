FROM public.ecr.aws/docker/library/python:3.8-slim as builder
COPY . /src
RUN pip install --user fastapi uvicorn boto3 flask

FROM public.ecr.aws/docker/library/python:3.8-slim as app
COPY --from=builder /root/.local /root/.local
COPY --from=builder /src .

ENV PATH=/root/.local:$PATH
EXPOSE 80

CMD ["python3", "app.py"]
