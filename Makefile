test:
	@echo "------------------------------------------"
	@echo "|-Starting unit tests for ScoreBoard App-|"
	@echo "------------------------------------------"
	@xcodebuild test -project ScoreBoard.xcodeproj -scheme ScoreBoardTests -destination 'platform=iOS Simulator,name=iPhone 14 Pro,OS=16.4'
	@echo "------------------------------------------"
	@echo "|---------Unit tests run finished---------|"
	@echo "------------------------------------------"

gha_test:
	@echo "------------------------------------------"
	@echo "|-Starting unit tests for ScoreBoard App-|"
	@echo "------------------------------------------"
	@xcodebuild test -project ScoreBoard.xcodeproj -scheme ScoreBoardTests -destination 'platform:iOS Simulator, id:dvtdevice-DVTiOSDeviceSimulatorPlaceholder-iphonesimulator:placeholder, name:Any iOS Simulator Device'
	@echo "------------------------------------------"
	@echo "|---------Unit tests run finished---------|"
	@echo "------------------------------------------"

autocorrectfiles:
	@echo "------------------------------"
	@echo "|-Fixing swift lint warnings-|"
	@echo "------------------------------"
	@swiftlint --fix
	@echo "------------------------------"
	@echo "|-Autocorrect files finished-|"
	@echo "------------------------------"
