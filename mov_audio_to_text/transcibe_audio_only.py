#!/usr/bin/env python3

import sys
import argparse
import whisper

def main():
    parser = argparse.ArgumentParser(
        description="Transcribe an existing audio file with a specified Whisper model."
    )
    parser.add_argument(
        "audio_file", 
        help="Path to the audio file to transcribe (e.g. .wav, .mp3, .m4a)."
    )
    parser.add_argument(
        "--model", 
        default="large", 
        help="Which Whisper model to use (tiny|base|small|medium|large, etc.). Default is 'large'."
    )
    parser.add_argument(
        "--out", 
        default="transcript.txt", 
        help="Output filename for the transcript (default: transcript.txt)."
    )

    args = parser.parse_args()

    print(f"Loading Whisper model: {args.model} ...")
    model = whisper.load_model(args.model)

    print(f"Transcribing {args.audio_file} ...")
    result = model.transcribe(args.audio_file)

    # Extract just the transcribed text
    transcription = result["text"]

    with open(args.out, "w", encoding="utf-8") as f:
        f.write(transcription + "\n")

    print(f"Transcription saved to '{args.out}'.")

if __name__ == "__main__":
    main()

