### Listing projects
The following syntax displays a list of all known projects on the specified project:
```
cpdctl dsjob list-projects [--sort|--sort-by-time] [--with-id] [--output json]
```

- `with-id` when specified prints the project id and project name.
- `sort` when specified returns the list of projects sorted in alphabetical order.
This field is optional.
- `sort-by-time` when specified sorts the list by create or update time. One of
`sort` or `sort-by-time` can be specified.
- `output`  specifies the format of the output. This field is optional.


A list of all the projects is displayed, one per line.
A status code is printed to the
output. A status code of 0 indicates successful completion of the command.


### Creating projects
The following syntax is used to create a project:

CPD:
```
cpdctl dsjob create-project -n NAME 
```
CPDaaS:
```
cpdctl dsjob create-project -n NAME [--storage <STG>] [--storage-type bmcos_object_storage|amazon_s3]
```
- `name` is the name of the project that is being created.
- `storage` is the name of the CRN for cloud, for example:
`crn:v1:staging:public:cloud-object-storage:global:a/`.
- `type` is the storage type for cloud. The default value is
`bmcos_object_storage` and the alternate value is `amazon_s3`.

The project ID of the created project is printed to the output.
A status code is
printed to the output. A status code of 0 indicates successful completion of the command.


### Deleting projects
The following syntax is used to delete a project:
```
cpdctl dsjob delete-project {--project PROJECT | --project-id PROJID}
```
- `project` is the name of the project that is being deleted.
- `project-id` is the id of the project that is being deleted. One of
`project` or `project-id` must be specified.

A status code is printed to the output. A status code of 0 indicates successful completion
of the command.


## Jobs

### Listing jobs
The following syntax displays a list of all jobs in the specified project:
```
cpdctl dsjob list-jobs {--project PROJECT | --project-id PROJID} [--sort | --sort-by-time] [--with-id] [--sched-info]
```

- `project` is the name of the project that contains the jobs to list.
- `project-id` is the id of the project. One of `project` or
`project-id` must be specified.
- `sort` when specified returns the list of jobs sorted in alphabetical order. This
field is optional.
- `with-id` when specified prints the job id along with the name of the job.
- `sort-by-time` when specified sorts the list by last update time. One of `sort` or `sort-by-time` can be specified.
- `sched-info` shows schedule information for jobs that are configured to run on a schedule.

A status code is printed to the output. A status code of 0 indicates successful completion of the
command.


### Creating jobs
The following syntax creates a job in the specified project:
```
cpdctl dsjob create-job {--project PROJECT | --project-id PROJID} {--flow NAME | --flow-id ID} [--name NAME] [--description DESCRIPTION] [--schedule-start yyyy-mm-dd:hh:mm] [--schedule-end yyyy-mm-dd:hh:mm] [--repeat every/hourly/daily/monthly --minutes (0-59) --hours (0-23) --day-of-week (0-6) --day-of-month (1-31)]
```


- `project` is the name of the project that the job is created for. 
- `project-id` is the id of the project. One of `project` or
`project-id` must be specified.
- `name` is the name of the job to be created.
- `description` is the description of the job to be created. This field is
optional.
- `flow` is the name of the flow. This field must be specified.
- `repeat` indicates frequency of job run. Permitted values are
`every`, `hourly`, `daily`, `weekly`,
and `monthly`. The default value is `none`.
- `minutes` indicates interval in minutes or the minutes at which to run the job.
Values in the range 0-59 are accepted.
- `hours` indicates hour of the day at which to run the job. Values in the range
0-23 are accepted.
- `day-of-month` repeats on day of the month, works with minutes and hours. Values
in the range 0-31 are accepted. Ex: 2 (runs on the second of the month).
- `schedule-start` is the starting time for scheduling a job.
- `schedule-end` is the ending time for scheduling a job.
