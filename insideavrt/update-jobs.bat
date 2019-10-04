@echo off

call app/console tenstreet:download-feed
call app/console tenstreet:import-job-postings