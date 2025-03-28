#!/bin/bash
# Backup script that runs daily at midnight
tar -czf /path/to/backup/archive_$(date +%F).tar.gz /path/to/important/files