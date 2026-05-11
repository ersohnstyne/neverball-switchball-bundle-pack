dir_pattern=(./data/map-sb*/)
shopt -s nullglob
dirs=($dir_pattern)
if (( ${#dirs[@]} > 0 )); then
  if [ -d "${dirs[@]}" ]; then
    in_file=$(find "${dirs[@]}" -type f | grep .map)
    in_file_plain=$(<$in_file);

    in_file_song="";
    in_file_back="";
    in_file_grad="";

    #if [[ $in_file_plain != *"\"classname\""* ]]; then
    #  echo "${in_file}: error: Missing classname!"
    #  exit 1;
    #elif [[ $in_file_plain != *"\"classname\" \"worldspawn\""* ]]; then
    #  echo "${in_file}: error: Invalid level map type! Must be assigned as worldspawn!"
    #  exit 1;
    #fi
    
    if [[ $in_file_plain == *"\"bonus\""* && $in_file_plain != *"\"bonus\" \"0\""* ]]; then
      echo "${in_file}: error: Bonus level detected! Switchball does not offer bonus levels!"
      exit 1;
    fi

    if [[ $in_file_plain == *"\"time\""* && $in_file_plain != *"\"time\" \"0\""* ]]; then
      echo "${in_file}: error: Time limit detected! Switchball does not offer limited time!"
      exit 1;
    fi

    if [[ $in_file_plain != *"\"time_hs\""* ]]; then
      echo "${in_file}: error: Missing Best Time HS!"
      exit 1;
    fi

    if [[ $in_file_plain != *"\"goal_hs\""* ]]; then
      echo "${in_file}: error: Missing Fast Unlock HS!"
      exit 1;
    fi

    if [[ $in_file_plain != *"\"author\""* || $in_file_plain == *"\"author\" \"\""* ]]; then
      echo "${in_file}: error: Requires signed level map!"
      exit 1;
    fi

    if [[ $in_file_plain != *"\"song\""* || $in_file_plain == *"\"song\" \"\""* ]]; then
      echo "${in_file}: error: Requires level music!"
      exit 1;
    fi

    if [[ $in_file_plain != *"\"song\" \"bgm/track-SB1.ogg\""* &&
          $in_file_plain != *"\"song\" \"bgm/track-SB2.ogg\""* &&
          $in_file_plain != *"\"song\" \"bgm/track-SB3.ogg\""* &&
          $in_file_plain != *"\"song\" \"bgm/track-SB4.ogg\""* &&
          $in_file_plain != *"\"song\" \"bgm/track-SB5.ogg\""* ]]; then
      echo "${in_file}: error: Mismatch level music!"
      exit 1;
    else
      in_file_song=$(grep "\"bgm/" ${in_file} | awk '{print $2}');
    fi

    if [[ $in_file_plain != *"\"back\""* ]]; then
      echo "${in_file}: error: Requires background environment!"
      exit 1;
    elif [[ $in_file_plain != *"\"back\" \"map-back/sky-SB.sol\""* &&
            $in_file_plain != *"\"back\" \"map-back/ice-SB.sol\""* &&
            $in_file_plain != *"\"back\" \"map-back/cave-SB.sol\""* &&
            $in_file_plain != *"\"back\" \"map-back/clouds-SB.sol\""* &&
            $in_file_plain != *"\"back\" \"map-back/lava-SB.sol\""* &&
            $in_file_plain != *"\"back\" \"map-back/sky-SB.solx\""* &&
            $in_file_plain != *"\"back\" \"map-back/ice-SB.solx\""* &&
            $in_file_plain != *"\"back\" \"map-back/cave-SB.solx\""* &&
            $in_file_plain != *"\"back\" \"map-back/clouds-SB.solx\""* &&
            $in_file_plain != *"\"back\" \"map-back/lava-SB.solx\""* ]]; then
      echo "${in_file}: error: Mismatch background environment!"
      exit 1;
    else
      in_file_back=$(grep "\"map-back/" ${in_file} | awk '{print $2}');
    fi

    if [[ $in_file_plain != *"\"grad\""* ]]; then
      echo "${in_file}: error: Requires background gradient!"
      exit 1;
    elif [[ $in_file_plain != *"\"grad\" \"back/sky-SB.png\""* &&
            $in_file_plain != *"\"grad\" \"back/ice-SB.png\""* &&
            $in_file_plain != *"\"grad\" \"back/cave-SB.png\""* &&
            $in_file_plain != *"\"grad\" \"back/clouds-SB.png\""* &&
            $in_file_plain != *"\"grad\" \"back/lava-SB.png\""* ]]; then
      echo "${in_file}: error: Mismatch background gradient!"
      exit 1;
    else
      in_file_grad=$(grep "\"back/" ${in_file} | awk '{print $2}');
    fi

    # SKY WORLD
    if [[ $in_file_song == *"bgm/track-SB1.ogg"* ]]; then
      if [[ $in_file_back != *"map-back/sky-SB.sol"* &&
            $in_file_back != *"map-back/sky-SB.solx"* ]]; then
        echo "${in_file}: error: Mismatch background environment from sky world music!"
        exit 1;
      fi
      if [[ $in_file_grad != *"back/sky-SB.png"* ]]; then
        echo "${in_file}: error: Mismatch background gradient from sky world music!"
        exit 1;
      fi
    fi

    # ICE WORLD
    if [[ $in_file_song == *"bgm/track-SB2.ogg"* ]]; then
      if [[ $in_file_back != *"map-back/ice-SB.sol"* &&
            $in_file_back != *"map-back/ice-SB.solx"* ]]; then
        echo "${in_file}: error: Mismatch background environment from ice world music!"
        exit 1;
      fi
      if [[ $in_file_grad != *"back/ice-SB.png"* ]]; then
        echo "${in_file}: error: Mismatch background gradient from ice world music!"
        exit 1;
      fi
    fi

    # CAVE WORLD
    if [[ $in_file_song == *"bgm/track-SB3.ogg"* ]]; then
      if [[ $in_file_back != *"map-back/cave-SB.sol"* &&
            $in_file_back != *"map-back/cave-SB.solx"* ]]; then
        echo "${in_file}: error: Mismatch background environment from cave world music!"
        exit 1;
      fi
      if [[ $in_file_grad != *"back/cave-SB.png"* ]]; then
        echo "${in_file}: error: Mismatch background gradient from cave world music!"
        exit 1;
      fi
    fi

    # CLOUD WORLD
    if [[ $in_file_song == *"bgm/track-SB4.ogg"* ]]; then
      if [[ $in_file_back != *"map-back/clouds-SB.sol"* &&
            $in_file_back != *"map-back/clouds-SB.solx"* ]]; then
        echo "${in_file}: error: Mismatch background environment from cloud world music!"
        exit 1;
      fi
      if [[ $in_file_grad != *"back/clouds-SB.png"* ]]; then
        echo "${in_file}: error: Mismatch background gradient from cloud world music!"
        exit 1;
      fi
    fi

    # LAVA WORLD
    if [[ $in_file_song == *"bgm/track-SB5.ogg"* ]]; then
      if [[ $in_file_back != *"map-back/lava-SB.sol"* &&
            $in_file_back != *"map-back/lava-SB.solx"* ]]; then
        echo "${in_file}: error: Mismatch background environment from lava world music!"
        exit 1;
      fi
      if [[ $in_file_grad != *"back/lava-SB.png"* ]]; then
        echo "${in_file}: error: Mismatch background gradient from lava world music!"
        exit 1;
      fi
    fi

    #if [[ ! -r ${in_file} ]]; then
    #  echo "${in_file}: error: File not found or not readable!"
    #  exit 1;
    #fi

    while IFS= read -r in_file_line || [[ -n $in_file_line ]]; do
      if [[ $in_file_line == *"\"version\""* ]]; then
        echo "${in_file}: info: Checking version format..."
        if [[ $in_file_line =~ \"([0-9]+)\.([0-9]+)\" ]]; then
          echo "${in_file}: info: Checking version values..."
          version_major=${BASH_REMATCH[1]}
          version_minor=${BASH_REMATCH[2]}
          if [[ version_major -gt 20000 ]]; then
            echo "${in_file}: error: Too futuristic!: version_major <= 20000"
            exit 1;
          fi
          if [[ version_minor -gt 200000000 ]]; then
            echo "${in_file}: error: Too futuristic!: version_minor <= 200000000"
            exit 1;
          fi
        else
          echo "${in_file}: error: Invalid version format!"
          exit 1;
        fi
      fi

      if [[ $in_file_line == *"\"coin_hs\""* ]]; then
        echo "${in_file}: info: Checking Most Coins HS format..."
        if [[ $in_file_line =~ \"([0-9]+)\ ([0-9]+)\ ([0-9]+)\" ]]; then
          echo "${in_file}: info: Checking Most Coins HS values..."
          coin_hs_hard=${BASH_REMATCH[1]}
          coin_hs_medm=${BASH_REMATCH[2]}
          coin_hs_easy=${BASH_REMATCH[3]}
          if [[ $coin_hs_hard -lt $coin_hs_medm ]]; then
            echo "${in_file}: error: coin_hs_medm is greater than coin_hs_hard!"
            exit 1;
          fi
          if [[ $coin_hs_hard -lt $coin_hs_easy ]]; then
            echo "${in_file}: error: coin_hs_easy is greater than coin_hs_hard!"
            exit 1;
          fi
          if [[ $coin_hs_medm -lt $coin_hs_easy ]]; then
            echo "${in_file}: error: coin_hs_easy is greater than coin_hs_medm!"
            exit 1;
          fi
        else
          echo "${in_file}: error: Invalid Best Time HS format!"
          exit 1;
        fi
      fi

      if [[ $in_file_line == *"\"time_hs\""* ]]; then
        echo "${in_file}: info: Checking Best Time HS format..."
        if [[ $in_file_line =~ \"([0-9]+)\ ([0-9]+)\ ([0-9]+)\" ]]; then
          echo "${in_file}: info: Checking Best Time HS values..."
          time_hs_hard=${BASH_REMATCH[1]}
          time_hs_medm=${BASH_REMATCH[2]}
          time_hs_easy=${BASH_REMATCH[3]}
          if [[ $time_hs_hard -gt $time_hs_medm ]]; then
            echo "${in_file}: error: time_hs_hard is greater than time_hs_medm!"
            exit 1;
          fi
          if [[ $time_hs_hard -gt $time_hs_easy ]]; then
            echo "${in_file}: error: time_hs_hard is greater than time_hs_easy!"
            exit 1;
          fi
          if [[ $time_hs_medm -gt $time_hs_easy ]]; then
            echo "${in_file}: error: time_hs_medm is greater than time_hs_easy!"
            exit 1;
          fi
        else
          echo "${in_file}: error: Invalid Best Time HS format!"
          exit 1;
        fi
      fi

      if [[ $in_file_line == *"\"goal_hs\""* ]]; then
        echo "${in_file}: info: Checking Fast Unlock HS format..."
        if [[ $in_file_line =~ \"([0-9]+)\ ([0-9]+)\ ([0-9]+)\" ]]; then
          echo "${in_file}: info: Checking Fast Unlock HS values..."
          goal_hs_hard=${BASH_REMATCH[1]}
          goal_hs_medm=${BASH_REMATCH[2]}
          goal_hs_easy=${BASH_REMATCH[3]}
          if [[ $goal_hs_hard -gt $goal_hs_medm ]]; then
            echo "${in_file}: error: goal_hs_hard is greater than goal_hs_medm!"
            exit 1;
          fi
          if [[ $goal_hs_hard -gt $goal_hs_easy ]]; then
            echo "${in_file}: error: goal_hs_hard is greater than goal_hs_easy!"
            exit 1;
          fi
          if [[ $goal_hs_medm -gt $goal_hs_easy ]]; then
            echo "${in_file}: error: goal_hs_medm is greater than goal_hs_easy!"
            exit 1;
          fi
        else
          echo "${in_file}: error: Invalid Fast Unlock HS format!"
          exit 1;
        fi
      fi
    done < ${in_file}

    echo "${in_file}: Done!"
  else
    echo "There's no level maps associated in map-sb*! (skipped)"
  fi
else
  echo "There's no level maps associated in map-sb*! (skipped)"
fi
