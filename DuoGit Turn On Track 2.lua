-- Enables record arm for guitar track 2
-- Guitar Track in Reaper needs to start with "git"
-- Guitar Track in Reaper needs to end with "2"
-- All other guitar tracks starting with "git" will be disabled

trackIdentifier = "GIT"
trackId = "2"

function string.starts(String, Start)
   return string.sub(String, 1, string.len(Start)) == Start
end

function string.ends(String, End)
    return string.sub(string.reverse(String), 1, string.len(End)) == string.reverse(End)
end

trackCount = reaper.GetNumTracks()
for i = 0, trackCount - 1, 1
do
    tr = reaper.GetTrack(0, i)
    tName = ""
    retval, tName = reaper.GetTrackName(tr, tName)
    tName = string.upper(tName)
    if (string.starts(tName, trackIdentifier)) then
       if (string.ends(tName, trackId)) then
         reaper.SetMediaTrackInfo_Value(tr, "I_RECARM", 1)
       else
         reaper.SetMediaTrackInfo_Value(tr, "I_RECARM", 0)
       end
    end
end
