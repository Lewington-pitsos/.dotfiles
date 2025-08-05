#!/bin/zsh

mins="$1"
delay=0

# ── Validate input ───────────────────────────────────────────────────────────────
if [[ "$mins" == "NOW" ]]; then
  delay=0
elif [[ "$mins" =~ '^[0-9]+$' ]]; then
  delay=$((mins * 60))
else
  echo "Usage: persistent_timer <minutes|NOW>"
  exit 1
fi

echo "Timer set for $mins minute(s). Press Ctrl+C to stop at any time."

# ── START-OF-TIMER PHRASES (20) ─────────────────────────────────────────────────
start_phrases=(
  "Here we go!"                  "It begins."                       "Let's boogie."
  "Off we go."                   "Time to kick things off."         "And we're live."
  "The show starts now."         "Launch sequence engaged."         "Let the games begin."
  "We're on the clock."           "Ignition!"                       "awwww shit, here we go again"
  "Go time fuckwad."                     "Rolling."                         "We're underway."
  "Liftoff!"                         "On your marks..."
  "Time to shine fuckhead"               
)

# Only play starting sound if timer is 25 minutes or more
if [[ "$mins" != "NOW" && "$mins" -ge 25 ]]; then
  say "${start_phrases[RANDOM % ${#start_phrases[@]} + 1]}" &
fi

# Wait for the countdown to finish (or zero seconds for NOW)
sleep "$delay"

# ── END-OF-TIMER PHRASES (50) ───────────────────────────────────────────────────
end_phrases=(
  "time to go fucker"            "Time's up mate"                   "newsflash asshole, time to go"
  "it is time"                   "wrap it up champ"                 "you've overstayed your welcome"
  "alright, that's enough"       "get moving, lazybones"            "time waits for no one"
  "tick tock motherfucker"       "this is your cue to leave"        "it's over, pack it up"
  "you've had your fun, now move" "chop chop, let's go"             "come on, time's not infinite"
  "end of the line, buddy"       "you know what time it is"         "closing time, friend"
  "the clock says no"            "final warning — move it"
  "the hourglass is empty"       "zero hour has arrived"            
  "game over, pal"               "finito—skedaddle"                 "pull the plug, we're done"
  "lights out, clown"            "that's a wrap"                    
  "quota of seconds spent"       "party's over, hit the bricks"
  "last call, get out"            "tick tock"
  "time expired"                 "if you don't stop right now I will literally kill you"         
  "alarm's howling, move along"
  "out of sand, amigo"           "the bell tolled for thee"         "enough dilly-dallying"         
  "abort"             
)

# ── Loop config ────────────────────────────────────────────────────────────────
wait_time=1.7   # initial gap
min_wait=0.4    # fastest gap
step=0.1       # shrink per cycle

# ── Cleanup on Ctrl-C ──────────────────────────────────────────────────────────
cleanup() {
  echo "\nExiting... Killing all 'say' processes."
  pkill -f "say"
  exit 0
}
trap cleanup SIGINT
echo "ding dong bitch!"

# ── Endless announcement loop ─────────────────────────────────────────────────
while true; do
  phrase=${end_phrases[RANDOM % ${#end_phrases[@]} + 1]}
  say "$phrase" &
  sleep "$wait_time"

  if (( $(echo "$wait_time > $min_wait" | bc -l) )); then
    wait_time=$(echo "$wait_time - $step" | bc)
  fi
done
