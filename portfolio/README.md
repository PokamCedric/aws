
## Benefits

In five simple and easy steps you have learned how to host your static website out of AWS S3. Not to mention you scored some benefits from moving your static website to S3.

Low cost — Hosting a website in S3 does not incur extra charges. You are paying standard S3 prices on GET requests and Data Transfer out of the bucket when a user visits your site.

    GET Requests cost $0.004 per 10,000 requests
    Data Transfer Out cost $0.090 per GB (up to 10 TB / month)

A Cost breakdown example: Let’s say that www.my-awesome-site.com loads 20 resources. The total size of those resources per visit is 1MB. The average total monthly visits is 20,000. Then we estimate the total cost of S3 on a monthly basis at around $1.96 per month.

Not long ago, you paid $10/month, so $2 is worth it.

Maintenance — Your static website now resides in S3. There is no longer any server side code to maintain and no web servers to configure and keep up to date.

Scale — S3 is a high availability and durable service that AWS maintains. If your website goes from 10 users a day to 10 million, S3 scales your website automatically.

Security — There is no server running that you maintain. Thus you avoid making configuration errors that make you vulnerable to attacks. You are still responsible for the security of your bucket. Remember your website bucket is public!

Those are some serious wins under your belt. With an S3 website setup, you have a foundation to build on to extend and leverage even more of AWS.