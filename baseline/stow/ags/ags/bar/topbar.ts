// @ts-ignore
import { Bar, Widget } from 'resource:///com/github/Aylur/ags/widget.js';

export default function topBar() {
    return Bar({
        name: 'top-bar',
        anchor: ['top', 'left', 'right'],
        exclusivity: 'exclusive',
        height: 32,
        child: Widget.Box({
            spacing: 12,
            homogeneous: false,
            class_name: 'bar',
            children: [
                // Left section
                Widget.Box({
                    spacing: 8,
                    children: [
                        Widget.Icon({ icon: 'arch', size: 24 }),
                        Widget.Label(() => '100% 🔒 87% 🎤')
                    ],
                }),

                Widget.CenterBox({
                    startWidget: Widget.Box({
                        spacing: 6,
                        children: [
                            Widget.Label(() => ' - 1'),
                            Widget.Label({ label: '🌐 - 2', class_name: 'active' }),
                            Widget.Label({ label: ' - 3', class_name: 'active' }),
                            Widget.Label(() => ' - 4'),
                            Widget.Label(() => ' - 5'),
                            Widget.Label(() => ' - 6'),
                            Widget.Label({ label: ' - 8', class_name: 'active' }),
                        ]
                    })
                }),

                // Right section
                Widget.Box({
                    spacing: 8,
                    hpack: 'end',
                    children: [
                        Widget.Label(() => 'NOS-FF16-5 (88%) 📶'),
                        Widget.Label(() => '🧠 45% 💾 7% 🔋 97%'),
                        Widget.Label(() => '20:41'),
                        Widget.Label(() => '🔔 36'),
                    ]
                })
            ]
        })
    });
}
