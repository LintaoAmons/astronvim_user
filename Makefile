SOURCE_PATH="${HOME}/.config/nvim/lua/user"
TMP_PATH=/tmp/user

.PHONY: upload
upload: build-artifact
	git -C ${TMP_PATH} init
	git -C ${TMP_PATH} branch -M main
	git -C ${TMP_PATH} add --all
	git -C ${TMP_PATH} commit -m "update"
	git -C ${TMP_PATH} remote add origin git@github.com-personal:LintaoAmons/astronvim_user.git
	git -C ${TMP_PATH} push --force -u origin main

.PHONY: build-artifact
build-artifact:
	rm -rf "${TMP_PATH}"
	cp -r ${SOURCE_PATH} ${TMP_PATH}
	rm -rf "${TMP_PATH}/.git"

	echo "这个一点都不稳定，我会\`git force push\` 更新\n" >> "${TMP_PATH}/README.md"
	echo "如果你想保留现在这个配置，直接 fork 一份，记得给个 star 哦~\n" >> "${TMP_PATH}/README.md"

	echo "This isn't stable, I will force push new changes.\n" >> "${TMP_PATH}/README.md"
	echo "If you want save current config, please just fork it. Please give me a start~\n" >> "${TMP_PATH}/README.md"
	echo "The reason you can find in the MAKEFILE" >> "${TMP_PATH}/README.md"
