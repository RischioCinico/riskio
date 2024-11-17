var panel = new Panel
var panelScreen = panel.screen

panel.location = "top"
panel.height = 3 * Math.floor(gridUnit * 16 / 20)
panel.width = screenGeometry(panelScreen).width

panel.addWidget("org.kde.plasma.kickoff")
panel.addWidget("org.kde.plasma.pager")
panel.addWidget("org.kde.plasma.icontasks")
panel.addWidget("org.kde.plasma.panelspacer")
panel.addWidget("org.kde.plasma.systemtray")
panel.addWidget("org.kde.plasma.digitalclock")
panel.addWidget("org.kde.plasma.showdesktop")
