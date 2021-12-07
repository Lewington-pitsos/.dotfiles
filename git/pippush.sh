python update.py VERSION --importance $2

git add *
git add -A

git commit -m "$1"

git push origin $3