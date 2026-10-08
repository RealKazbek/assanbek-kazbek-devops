# DevOps Laboratory Work

This repository is the individual DevOps laboratory project of Kazbek Assanbek (IT2-2302, Student ID 37765).

It demonstrates a complete Linux, Git, Docker, and Jenkins workflow. See `CHECKLIST.md` for current verification status, `reports/` for the report, `VIDEO_GUIDE.md` for the recording walkthrough, and `docs/OPERATIONS.md` for concise command explanations.

## Local verification

```sh
python3 -m unittest discover -s tests -v
docker build -t assanbek-kazbek-devops .
docker run -d --name assanbek-kazbek-container -p 8081:8080 assanbek-kazbek-devops
docker logs assanbek-kazbek-container
docker compose up -d --build
docker compose down
```
