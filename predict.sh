docker run -e TF_GPU_MEMORY_FRACTION=0.9 --runtime=nvidia -it --rm --volumes-from=fever-common -v ${pwd}/final_predictions:/out -v ${pwd}:/in feverai/builder-athene bash ./predict.sh /in/sears.999.everything.jsonl /out/fever-athene/sears.all.jsonl
docker rmi feverai/builder-athene
docker run --runtime=nvidia -it --rm --volumes-from=fever-common -v ${pwd}/final_predictions:/out -v ${pwd}:/in feverai/builder-papelo bash ./predict.sh /in/sears.999.everything.jsonl /out/fever-papelo/sears.all.jsonl
docker rmi feverai/builder-papelo
docker run --runtime=nvidia -it --rm --volumes-from=fever-common -v ${pwd}/final_predictions:/out -v ${pwd}:/in feverai/builder-unc bash ./predict.sh /in/sears.999.everything.jsonl /out/fever-unc/sears.all.jsonl
docker rmi feverai/builder-unc
docker run --runtime=nvidia -it --rm --volumes-from=fever-common -v ${pwd}/final_predictions:/out -v ${pwd}:/in feverai/builder-uclmr bash ./predict.sh /in/sears.999.everything.jsonl /out/fever-ucl/sears.all.jsonl
docker rmi feverai/builder-uclmr

