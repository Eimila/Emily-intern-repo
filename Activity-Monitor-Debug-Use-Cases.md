# Activity Monitor Debug Use Cases

Activity Monitor is a macOS tool for checking what apps and background processes are doing. It is useful for debugging performance, battery, memory, and process behavior problems.

## Useful Debugging Examples

1. **Investigating high CPU usage**
   Use the CPU tab to sort processes by CPU percentage. This helps identify apps or background processes that are using too much processing power.

2. **Checking memory spikes**
   Use the Memory tab to watch memory pressure and identify apps that suddenly use a large amount of RAM.

3. **Finding frozen apps**
   If an app stops responding, Activity Monitor can show whether it is still active, stuck, or using unusual system resources.

4. **Confirming blocked apps are running correctly**
   If a focus or blocking app is meant to stay active in the background, Activity Monitor can confirm that its helper process is still running.

5. **Debugging notification timing issues**
   If reminders or notifications arrive late, Activity Monitor can help check whether the related app or background process is running at the expected time.

6. **Verifying background processes behave as expected**
   Some apps use helper processes for syncing, blocking, updates, or scheduling. Activity Monitor helps confirm those helpers start and stop correctly.

7. **Checking energy impact**
   The Energy tab can show which apps are draining battery or waking the system too often.

8. **Reviewing network activity**
   The Network tab helps identify apps that are sending or receiving unexpected data.

9. **Checking disk activity**
   The Disk tab can help investigate apps that are constantly reading or writing files.

10. **Force quitting problem processes**
    If an app is frozen or using too many resources, Activity Monitor can quit or force quit the process.

## Reflection

Activity Monitor is useful because it gives evidence instead of guesses. When debugging, it can show which process is running, how much CPU or memory it uses, whether it affects battery life, and whether background helpers are behaving correctly.
