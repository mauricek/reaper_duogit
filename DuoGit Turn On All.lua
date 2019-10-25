-- Enables record arm for all guitar tracks
-- Guitar Track in Reaper needs to start with "git"

trackIdentifier = "GIT"

function string.starts(String, Start)
   return string.sub(String, 1, string.len(Start)) == Start
end

trackCount = reaper.GetNumTracks()
for i = 0, trackCount - 1, 1
do
    tr = reaper.GetTrack(0, i)
    tName = ""
    retval, tName = reaper.GetTrackName(tr, tName)
    tName = string.upper(tName)
    if (string.starts(tName, trackIdentifier)) then
       reaper.SetMediaTrackInfo_Value(tr, "I_RECARM", 1)
    end
end

