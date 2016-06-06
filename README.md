# Empath
###Built for AngelHack Manhattan 2016
[Live Link][rails]
[rails]: http://empath-app.com

[Video Demo][video]
[video]: https://www.youtube.com/watch?v=j8-Q-nyyoHc

[Hackathon.io Profile][profile]
[profile]: http://www.hackathon.io/projects/11005


Empath is a B2B software as a service. We provide a management tool to analyze email communication across teams within an organization. Content is assessed and assigned a sentiment rating via HPE Haven's Sentiment Analysis API. Low sentiment ratings are flagged as exhibiting poor communication habits.

Empath empowers managers and employees to identify patterns that will improve team building and the performance review process. We believe we can vastly improve long-distance work and cross-cultural teams, which are crucial in a global economy, by learning their patterns and adjusting them. We are beginning to create what is called the “God’s-eye view” of the organization. But spiritual as that may sound, this view is rooted in evidence and data. It will change how organizations work.

## Our Vision
To nurture team building by encouraging healthy communication.

##Technologies
Ruby on Rails, React.js, PostgreSQL, HPE APIs, IBM Watson APIs

##Features

### Google+ OmniAuth
Users can login to the app via their Google+ account. The app grabs their profile image and name, which are displayed on the User Preferences page. The app also requests access to the user's entire email inbox for later analysis.

### Analyze Email Inbox by Sentiment
The app pulls 150 of the user's most recent emails and sorts them according to recipient. It then runs these emails through HPE Haven's Sentiment API to receive a sentiment score for each. These scores are averaged across all emails sent to a particular recipient, and the average score is presented to the user.

### Dig Deeper with IBM Watson's Tone Analyzer
Users can choose to analyze emails sent to a particular recipient to better understand tone, emotion, etc.

## Work in Progress / To Do

- [ ] Add IBM Watson email-based analysis
- [ ] Create tool for drafting communication that gives immediate feedback on sentiment
- [ ] Create admin user (manager) who can see high level trends amongst employees
- [ ] Support Outlook email messages or user uploaded content

## Visionaries

#### Brian Beir
[Github][github1]
[github1]: https://github.com/brianbier
[LinkedIn][linkedIn1]
[linkedIn1]: https://www.linkedin.com/in/brianbier

#### FJ Collins Jr.
[Github][github2]
[github2]: https://github.com/FJunior225
[LinkedIn][linkedIn2]
[linkedIn2]: https://www.linkedin.com/in/fjcollinsjr

#### Alyssa Ransbury
[Github][github3]
[github3]: https://github.com/alran
[LinkedIn][linkedIn3]
[linkedIn3]: https://www.linkedin.com/in/alyssaransbury

#### Noah Schutte
[Github][github4]
[github4]: https://github.com/noahschutte
[LinkedIn][linkedIn4]
[linkedIn4]: https://www.linkedin.com/in/noahschutte

#### Thomas Yancey
[Github][github5]
[github5]: https://github.com/thomas-yancey
[LinkedIn][linkedIn5]
[linkedIn5]: https://www.linkedin.com/in/tomyancey
