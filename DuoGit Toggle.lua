-- Toggles record arm for guitar tracks
-- Guitar Tracks in Reaper need to start with "git"

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
        if (reaper.GetMediaTrackInfo_Value(tr, "I_RECARM") == 1) then
            reaper.SetMediaTrackInfo_Value(tr, "I_RECARM", 0)
        else
            reaper.SetMediaTrackInfo_Value(tr, "I_RECARM", 1)
        end
    end
end
