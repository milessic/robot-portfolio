OUTPUT_DIR=/robot/output
ARCHIVE_NAME=output_files.zip

if [ -d "$OUTPUT_DIR" ] && [ "$(ls -A $OUTPUT_DIR)" ]; then
    zip -r "$OUTPUT_DIR/$ARCHIVE_NAME" "$OUTPUT_DIR" -r"$OUTPUT_DIR/browser"
    echo "Output files have been archived to $OUTPUT_DIR/$ARCHIVE_NAME"
else
    echo "No output files to gather"
fi
