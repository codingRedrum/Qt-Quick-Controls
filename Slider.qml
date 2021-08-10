/*****************************************************************************************************************
** Türkiye'nin Otomobili Girişim Grubu A.Ş. ("COMPANY") CONFIDENTIAL
** Unpublished Copyright (c) 2021 Türkiye'nin Otomobili Girişim Grubu A.Ş., All Rights Reserved.
**
** NOTICE:  All information contained herein is, and remains the property of COMPANY. The intellectual and
** technical concepts contained herein are proprietary to COMPANY and may be covered by U.S. and Foreign
** Patents, patents in process, and are protected by trade secret or copyright law. Dissemination of this
** information or reproduction of this material is strictly forbidden unless prior written permission is obtained
** from COMPANY.  Access to the source code contained herein is hereby forbidden to anyone except current
** COMPANY employees, managers or contractors who have executed Confidentiality and Non-disclosure agreements
** explicitly covering such access.
**
** The copyright notice above does not evidence any actual or intended publication or
** disclosure  of  this source code, which includes information that is confidential and/or proprietary,
** and is a trade secret, of  COMPANY. ANY REPRODUCTION, MODIFICATION, DISTRIBUTION, PUBLIC  PERFORMANCE,
** OR PUBLIC DISPLAY OF OR THROUGH USE  OF THIS  SOURCE CODE  WITHOUT  THE EXPRESS WRITTEN CONSENT OF
** COMPANY IS STRICTLY PROHIBITED, AND IN VIOLATION OF APPLICABLE LAWS AND INTERNATIONAL TREATIES.  THE
** RECEIPT OR POSSESSION OF  THIS SOURCE CODE AND/OR RELATED INFORMATION DOES NOT CONVEY OR IMPLY ANY RIGHTS
** TO REPRODUCE, DISCLOSE OR DISTRIBUTE ITS CONTENTS, OR TO MANUFACTURE, USE, OR SELL ANYTHING THAT IT  MAY
** DESCRIBE, IN WHOLE OR IN PART.
*****************************************************************************************************************/
import QtQuick 2.15
import QtQuick.Templates 2.15 as T
import QtGraphicalEffects 1.0
import shared.Style 1.0
import controls 1.0

T.Slider {
    id: root

    property alias valueText: _valueText.text
    property bool levelsVisible: false
    property alias iconSource: _icon.source
    property alias iconText: iconText.text

    implicitWidth: 186.0
    implicitHeight: 510.0
    orientation: Qt.Vertical
    handle: null

    background: Rectangle {
        id: bgRoot

        color: Style.neutralBlack10Color

        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Rectangle {
                width: bgRoot.width
                height: bgRoot.height
                radius: 36.0
            }
        }

        Rectangle {
            id: sliderFill

            width: parent.width
            height: parent.height * root.position
            anchors.bottom: parent.bottom
            color: Style.neutralWhiteColor
        }

        Item {
            id: discreteLevels

            readonly property real levelsCount: Math.round((to - from) / stepSize)
            readonly property real heightStep: height / levelsCount

            anchors.fill: parent
            visible: levelsVisible

            Repeater {
                model: levelsVisible ? (discreteLevels.levelsCount - 1) : 0

                Rectangle {
                    anchors {
                        left: parent.left; right: parent.right
                        bottom: parent.bottom
                        bottomMargin: (index + 1) * discreteLevels.heightStep
                    }
                    height: 3
                    color: Style.neutralBlack5Color
                }
            }
        }

        Text {
            id: _valueText

            anchors {
                top: parent.top; topMargin: 24.0
                horizontalCenter: parent.horizontalCenter
            }
            width: 90
            height: 50
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font: Style.screenTitleFont
            color: Style.neutralBlack72Color
            text: value.toFixed(0)
        }

        Column {
            anchors {
                bottom: parent.bottom; bottomMargin: 32.0
                horizontalCenter: parent.horizontalCenter
            }

            spacing: 6.0

            Icon {
                id: _icon

                anchors.horizontalCenter: parent.horizontalCenter
                height: 48
                glyphColor: Style.neutralBlackColor
                glyphSize: 48
            }

            Text {
                id: iconText

                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                height: 29
                font {
                    family: Style.standardFont.family
                    pixelSize: 22
                    weight: Font.Light
                }
                color: Style.neutralBlackColor
            }
        }
    }
}
