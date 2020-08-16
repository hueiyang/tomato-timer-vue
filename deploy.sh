npm run build
cd dist
git init
git add .
git commit -m 'deploy'
git push -f https://github.com/hueiyang/tomato-timer-vue.git master:gh-pages
