---
layout: post
title:  Our road to defining more explicit project roles
date:   2018-10-01 12:54:35 +0200
category: about-us
---

An insight into your own company or team to evaluate your weak points is one of the greatest tools you can use to improve. We’re constantly trying to do it using various ways (sprint retrospectives for example), but I’d like to believe critical thinking about ourselves run in our blood. This is why we recently identified a potential problem in the way we approach projects.

It became apparent to us, that the roles we take in each project are unclear. There is a huge gray area, especially between team leaders, senior developers and project managers. We haven’t talked about it much so obviously there are some expectations that are not met on both sides.

To challenge this we made a list of all project roles we feel are required, and we did this in two separate teams to combine different points of view. This list was strongly focused on team leader responsibilities first, but it became clear that it’s one-sided, and we cannot just dump all those responsibilities on one person, and that it varies from project to project.

## Project roles

What we did instead is a general list of roles. The obvious one is the ownership of the project — an umbrella role for all of the other ones. It just means being responsible (by proxy) for the whole project. As such it’s uninteresting for us, so I’ll focus on the rest (in random order):

### Helicopter view

Basically knowing more than is required to do your tasks, both in and out of your department. This allows you to connect the dots and make decisions based on the project as a whole. You can’t coordinate tasks and teamwork without a helicopter view. For example, knowing the design progress so you can anticipate and plan accordingly. Here is an even more trivial example, knowing when one department will finish their job so that another can start working on their part. Or to know when one person can help out another because they’ve done something similar or their tasks are related somehow.

### Responding to ad-hoc situations

If a project is on fire, you’re the first line of defense. You may (and probably need to) delegate it further, but you’re the rapid response team. This allows an easy way out for every team member if something goes wrong and an urgent fix is required, for example, the project needs an additional developer, because it’s behind schedule. Without this role the responsibility would be distributed among the whole team and as such, it would be ineffective.

### Reporting

You can present the project status to stakeholders and bring anyone up to date. This may relate only to certain fields of the project, such as development, design or other.

### Documenting

Updating knowledge on Confluence, so everyone is on the same page. Documenting has a broader meaning, but for the purpose of defining roles, let’s just stick to gathering all knowledge and arrangements in one place. This may be as trivial as meeting notes — someone has to do it. Without this role, there wouldn’t be a single source of truth about the project; everything would be scattered among JIRA tasks, emails, bug trackers, slack, etc.

### Risk Management

This is both bringing awareness of project risks to the team, as well as acting on the currently identified risks. For example, if we have a tight schedule, we need to pay extra attention to our estimates, and regular planning sessions should reflect that, and the team needs to be aware of the priorities — no needless refactors this time, sorry. 

### Project Management

Managing everything related to JIRA and short-term planning — daily standups, weekly or bi-weekly planning, assigning tasks if that rocks your boat, putting down estimations, looking at burndowns if you have them.

### Traffic / Role delegation

Helping in deciding which team member is best for the task at hand. Assigning roles mentioned here is also a traffic job, so I guess this role needs to be assigned first. 

### Planning / Task estimation

Self-explanatory. In contrast to project management, this is about giving the estimates during planning sessions using your best knowledge and expertise. This also means estimating larger chunks of projects based on your experience, not the actual detailed specs. This can guide high-level decisions as to what direction to choose, which parts of the project are unprofitable, etc.

### Announcing goals

Communicating with the team what is most important at a given time. In general, this can be understood as providing transparent communication to the team.

### Technical Expectation Management

This is similar to risk management. We know our shortcomings, or we know where the (client’s) disappointments usually come from, so we try to get ahead of them and warn people ahead of time. For example, if the team is inexperienced in a given technology we should announce that and explain what it would mean for the project, so nobody is surprised later. There is no better thing than a fuckup you know about in advance!

### Architecture

Designing high-level solutions, especially in the early project stages. This is a strictly technical role, and as such, it should be assigned to one of the senior developers. The architect needs to be included in the project as early as possible so they can have their input in the discovery phase.

### Consulting

Giving a helping hand in your area of expertise when needed. For example by attending a meeting or doing a code review, but not being otherwise involved in the project. 



## How can this list be useful to us?

After we created the above list, we had one last question to answer: what have we created? How will it help us in the future? Will we just stick a „this things need to be done” label on it and get on with our lives? Or will this become a part of the job description for new employees, so we can blissfully and naively give ourselves a high five for a job well done?

## Responsibility Assignment Matrix

The main takeaway for us is that we now have some kind of baseline we can work with. Our next step is to define who has each of those roles by creating a [responsibility assignment matrix](https://www.wikiwand.com/en/Responsibility_assignment_matrix) and go from there. 

Before we began, we had to choose the participation types for the matrix. The [PACSI scheme](https://www.wikiwand.com/en/Responsibility_assignment_matrix#/PACSI) seemed most fitting for us. We adopted it and defined it as follows for our needs:

 * **Perform** — this is the person doing the job in the end. No delegation, no maybes. For example, a developer needs to commit code to the repository. If they are not doing it regularly, something is off. You may not be solely responsible for the end product, though.
 * **Accountable** — this means both Performing, and delegating to others, but in the end is responsible for what is made. A great example of this is a senior dev — does some of the work by themselves, delegates some parts to junior devs but sings off on their work. This is also understood as one of your daily duties.
 * **Control** — you are not doing the work, but you may have a different perspective so you can veto the result presented to you. This role doesn’t seem fitting to our organization, so we used it very rarely. We’d rather work our a consensus, but not all processes allow us to do so.
 * **Suggest** — this is an interesting role. It basically means to us someone that is not involved in the process, and only responding to ad-hoc needs. If you weren’t asked to give your opinion or expertise, it’s not your fault if it’s not done. 
 * **Informed** — is a non-role actually. It just means some group needs to be kept in the loop. Everyone is informed by default in our organization. 

## The matrix blueprint for projects

We haven’t got to the point of evaluating an actual project, but we did make a blueprint — a starting point — to adapt in the future. Each participation type is defined in the context of the following groups:

 * **Project Owner** (PO) — the single person responsible for the project, as well as Project Managers that report to them. It seems that those groups may need to be split in the future.
 * **Technical lead** (TL) — one of the organization roles responsible for team management. They may or may not be actively participating in each project, so it’s challenging to assign __accountable__ and __perform__ roles to them. To simplify, this group should probably include the most senior dev in the project team.
 * **Technical director** (TD) — probably not involved in the project, especially in the later stages, but their expertise and high-level POV is invaluable.
 * **Team member** (TM) — everyone else, obviously.

This is what we came up with to start, with some examples of how this setup may work in practice:

| Role | PO | TL | TD | TM |
|---------|
| Helicopter view | A | S | I | I | 
| Project owner needs to know everything about the project, while the Tech lead may not be involved in the project, and can’t be required to know the project’s landscape |
| Ad-hoc situations | A | S | S | P | 
| Again, only the Project owner can respond to all situations, but usually delegates the execution to one of their lieutenants | 
| Ad-hoc situations (alternate) | A | I | I | S |
| This is a variant with a more self-contained team. Team members are appointed by the PO, and leaders are only informed about potential problems | 
| Reporting | A | S | I | S |
| PO is the only one that can see the whole project and asses its status, based on the team’s feedback and tech lead’s expertise — if needed | 
| Documenting | A | S | I | S |
| The important thing here is that the documentation is done in response to daily work made by the team | 
| Documenting (alternative) | C | A | S | P |
| This variant assumes creating documentation as a product for the client, for example during the discovery phase. We treat this as a technical task, and as such needs Tech lead’s supervision, with PO accepting or requesting changes to the end result |
| Risk management | A | A | S | A |
| Everyone needs to speak their mind if they see something is wrong. Be responsible and challenge potential problems early on instead of sweeping them under the rug | 
| Project management | A | S | S | P | 
| PO is responsible, but tech lead and director can give a helping hand, while the whole team is involved (sprint planning, estimations, converting business requirements to tasks, etc) | 
| Role delegation and team assembly | S | P | A | I | 
| This is the way it works for us. The CTO decides who will be assigned to a project based on team leaders input and PO’s requirements and preferences. After the project is started, assigning tasks is self-governing |
| Planning and estimations | C | A | S | S |
| A team leader is responsible for sensible estimations, done by the team, but the PO has the right to object and ask for a faster pace if the project requires it. This means going back to the drawing board and choosing different implementations, cutting corners, etc |
| Announcing goals and transparent communication | A | P | S | I | 
| ??? |
| Technical Expectation Management | I | A | S | P |
| Team members need to inform the stakeholders about technical debt, possible bugs, laconic requirements, complicated user interface, etc. |
| Architecture | I | A | S | S |
| A team leader is responsible, but probably delegates this to the most senior dev in the project, if they are not involved directly | 
| Consulting | S | S | S | S |
| By definition, consulting is a _suggest_ job. Giving this role to someone is just a hint, that they may be needed at some point in the project | 

## Conclusion

This model puts a lot of pressure on the Project Owner. If their role would include attending client meetings, for example, this would probably take most of their time and as such would make them ineffective. To counter this, as much as possible should be delegated to project managers.

Maybe this list isn’t complete? Maybe it’s too broad? Assigning those roles may cause some surprises or heated discussions. We may end up not assigning all of them if we feel none of us can do it right or just doesn’t have the time?

Whatever comes from it, we all have a strong feeling we will learn something about our culture and project management, and that it’s a solid cornerstone for further improvement.


