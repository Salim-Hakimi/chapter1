# StatefulWidget Lifecycle — Observation and Conclusion

## Expected observations

| Action | Expected lifecycle result |
|---|---|
| App first displays the counter widget | `initState()` runs once, followed by `build()` |
| Press the counter button | `setState()` changes the counter and `build()` runs again |
| Press the counter button repeatedly | `build()` runs again after each state update; `initState()` does not repeat |
| Remove the counter widget | `dispose()` runs for that widget |
| Show the counter widget again | A new State object is created; `initState()` and `build()` run again |
| Open the second page | The details page runs `initState()` and `build()` |
| Go back from the second page | The details page is removed and its `dispose()` runs |

## Example console output

The exact number and order of `build()` messages can vary because Flutter may rebuild widgets when their state or relevant parent state changes. A typical sequence is:

```text
LifecycleDemoWidget -> initState()
LifecycleDemoWidget -> build()
LifecycleDemoWidget -> build()   # after a setState() update
LifecycleDemoWidget -> build()   # after another setState() update
LifecycleDemoWidget -> dispose() # after removing the widget
LifecycleDemoWidget -> initState() # after showing a new instance
LifecycleDemoWidget -> build()
LifecycleDetailsPage -> initState()
LifecycleDetailsPage -> build()
LifecycleDetailsPage -> dispose() # after pressing Go back
```

## Short conclusion

The StatefulWidget lifecycle follows this general sequence: `initState()` is called once when a State object is inserted into the widget tree, `build()` creates the UI and can run many times, and `dispose()` is called when that State object is permanently removed. Calling `setState()` updates the state and schedules another `build()`; it does not call `initState()` again. If the widget is removed and later inserted again, Flutter creates a new State object and starts a new lifecycle. Navigation to another route does not automatically dispose the previous route because it normally remains in the navigation stack; the new route is disposed when it is popped.

## Student's actual run notes

Run the application and replace this section with your own observations if your teacher requires evidence from your device.

- Device / emulator: ______________________________
- Flutter version: ________________________________
- Number of counter taps tested: __________________
- Did `build()` run after each tap? ________________
- What happened when the demo widget was removed? __
- What happened when the details page was popped? ___
