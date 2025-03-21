#!/usr/bin/env python3

import sys
import sounddevice as sd
import wavio
import whisper

def main():
    # Require exactly one argument: number of minutes to record
    if len(sys.argv) < 2:
        print(f"Usage: {sys.argv[0]} <minutes_to_record>")
        sys.exit(1)

    # Convert the argument to an integer (minutes)
    record_minutes = int(sys.argv[1])

    # -----------------------------------------
    # Hard-code the device index for "pulse" 
    # from your "sounddevice list" output. 
    # In your listing, #13 is "pulse, ALSA (32 in, 32 out)".
    device_index = 13
    # -----------------------------------------

    # Recording settings
    sample_rate = 44100  # standard 44.1 kHz
    channels = 2         # stereo
    duration_sec = record_minutes * 60

    # Set default device
    sd.default.device = device_index

    print(f"Recording for {record_minutes} minute(s) from device index {device_index} ...")

    # Capture audio
    recording = sd.rec(frames=int(duration_sec * sample_rate),
                       samplerate=sample_rate,
                       channels=channels)
    sd.wait()  # Wait until recording is done

    # Save the audio to a WAV file
    wavio.write("output.wav", recording, sample_rate, sampwidth=2)
    print("Saved WAV file to 'output.wav'.")

    # Now transcribe using Whisper
    print("Transcribing with Whisper (this could take a while)...")
    model = whisper.load_model("large")  # or 'small', 'medium', 'large'
    result = model.transcribe("output.wav")
    transcription = result["text"]

    # Write the transcription to a text file
    with open("transcript.txt", "w", encoding="utf-8") as f:
        f.write(transcription + "\n")

    print("Transcription saved to 'transcript.txt'.")

if __name__ == "__main__":
    main()

