import QtQuick 2.7
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import radiance 1.0
import "."

VideoNodeTile {
    id: tile;

    normalHeight: 400;
    normalWidth: 300;

    ColumnLayout {
        anchors.fill: parent;
        anchors.margins: 15;

        RowLayout {
            Label {
                Layout.fillWidth: true;
                text: "Lux Output";
                color: "#ddd";
                elide: Text.ElideMiddle;
            }
        }

        Item {
            Layout.preferredHeight: width;
            Layout.fillWidth: true;
            layer.enabled: true;

            CheckerboardBackground {
                anchors.fill: parent;
            }
            VideoNodePreview {
                id: vnr;
                anchors.fill: parent;
                previewAdapter: Globals.previewAdapter;
                videoNode: tile.videoNode;
            }
        }

        RowLayout {
            Label {
                Layout.fillWidth: true;
                text: !videoNode ? "" : 
                    ("Outputs: " + videoNode.activeDeviceCount + "/" + videoNode.totalDeviceCount);
                color: "#ddd";
            }

            Button {
                text: "Refresh";
                onClicked: {
                    videoNode.refreshDevices();
                }
            }
        }
    }
}