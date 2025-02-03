CREATE TABLE IF NOT EXISTS `worker` (
                                        `id` int AUTO_INCREMENT NOT NULL UNIQUE,
                                        `name` varchar(100) NOT NULL,
    PRIMARY KEY (`id`)
    );

CREATE TABLE IF NOT EXISTS `milestons` (
                                           `id` int AUTO_INCREMENT NOT NULL UNIQUE,
                                           `name` varchar(100) NOT NULL,
    PRIMARY KEY (`id`)
    );

CREATE TABLE IF NOT EXISTS `categories` (
                                            `id` int AUTO_INCREMENT NOT NULL UNIQUE,
                                            `name` varchar(100) NOT NULL,
    PRIMARY KEY (`id`)
    );

CREATE TABLE IF NOT EXISTS `tasks` (
                                       `id` int AUTO_INCREMENT NOT NULL UNIQUE,
                                       `worker_id` int NOT NULL,
                                       `due_date` date NOT NULL,
                                       `progress_prcnt` int NOT NULL,
                                       `categ_id` int NOT NULL,
                                       `task_description` varchar(1000) NOT NULL,
    `is_arsal` boolean NOT NULL,
    `parent_id` int NOT NULL,
    `ordr` int NOT NULL,
    PRIMARY KEY (`id`)
    );

CREATE TABLE IF NOT EXISTS `task_to_milestones` (
                                                    `id` int AUTO_INCREMENT NOT NULL UNIQUE,
                                                    `task_id` int NOT NULL,
                                                    `milestones_id` int NOT NULL,
                                                    `status` int NOT NULL,
                                                    PRIMARY KEY (`id`)
    );

CREATE TABLE IF NOT EXISTS `remarks` (
                                         `id` int AUTO_INCREMENT NOT NULL UNIQUE,
                                         `content` varchar(1000) NOT NULL,
    PRIMARY KEY (`id`)
    );

CREATE TABLE IF NOT EXISTS `task_to_remarks` (
                                                 `id` int AUTO_INCREMENT NOT NULL UNIQUE,
                                                 `task_id` int NOT NULL,
                                                 `remark_id` int NOT NULL,
                                                 PRIMARY KEY (`id`)
    );




ALTER TABLE `tasks` ADD CONSTRAINT `tasks_fk1` FOREIGN KEY (`worker_id`) REFERENCES `worker`(`id`);

ALTER TABLE `tasks` ADD CONSTRAINT `tasks_fk4` FOREIGN KEY (`categ_id`) REFERENCES `categories`(`id`);

ALTER TABLE `tasks` ADD CONSTRAINT `tasks_fk7` FOREIGN KEY (`parent_id`) REFERENCES `tasks`(`id`);
ALTER TABLE `task_to_milestones` ADD CONSTRAINT `task_to_milestones_fk1` FOREIGN KEY (`task_id`) REFERENCES `tasks`(`id`);

ALTER TABLE `task_to_milestones` ADD CONSTRAINT `task_to_milestones_fk2` FOREIGN KEY (`milestones_id`) REFERENCES `milestons`(`id`);

ALTER TABLE `task_to_remarks` ADD CONSTRAINT `task_to_remarks_fk1` FOREIGN KEY (`task_id`) REFERENCES `tasks`(`id`);

ALTER TABLE `task_to_remarks` ADD CONSTRAINT `task_to_remarks_fk2` FOREIGN KEY (`remark_id`) REFERENCES `remarks`(`id`);