## zenoh Web-Site

The zenoh website (see [https://github.com/atolab/zenoh-web](https://github.com/atolab/zenoh-web) is generated using the (gohugo.io)[http://gohugo.io] framwork.

Thus the first step to contribute to the website is to install hugo.

Then, creating posts is pretty straightforward, you simply need to
execute the command:


      $ hugo new post/short-title.md

Then edit the file using the markdown syntax and when you are happy
with your content preview it by serving it with the command:

     $ hugo server -D

Once you are ready to deploy the new website do the following:

     $ hugo
     $ cp -R public/* /location/to/zenoh-web/

Then commit and push the changes on both repos. Verify that your
changes are visible and look OK on (zenoh.io)[http://zenoh.io]