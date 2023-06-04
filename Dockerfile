FROM tensorflow/serving

ENV MODEL_NAME rempasi
ENV MODEL_VERSION 1

COPY ./model /models/${MODEL_NAME}/${MODEL_VERSION}

ENV MODEL_BASE_PATH /models

ENV MODEL_NAME ${MODEL_NAME}
ENV MODEL_VERSION ${MODEL_VERSION}

EXPOSE 8501

CMD tensorflow_model_server \
    --port=8501 \
    --rest_api_port=8501 \
    --model_name=${MODEL_NAME} \
    --model_base_path=${MODEL_BASE_PATH}/${MODEL_NAME}