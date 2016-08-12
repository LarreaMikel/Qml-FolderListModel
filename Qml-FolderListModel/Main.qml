import QtQuick 2.4
import Ubuntu.Components 1.3
import Qt.labs.folderlistmodel 2.1

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "qml-folderlistmodel.larreamikel"

    width: units.gu(50)
    height: units.gu(75)

    Page {
        header: PageHeader {
            id: pageHeader
            title: i18n.tr("Qml-FolderListModel")
            StyleHints {
                foregroundColor: UbuntuColors.orange
                backgroundColor: UbuntuColors.porcelain
                dividerColor: UbuntuColors.slate
            }
        }

        ListView {
            width: units.gu(50)
            height: units.gu(30)
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: pageHeader.bottom
                topMargin: units.gu(2)
            }
            FolderListModel {
                id: folderModel
                nameFilters: ["*.qml"]
            }
            Component {
                id: fileDelegate
                Text { text: fileName }
            }
            model: folderModel
            delegate: fileDelegate
        }
    }
}

