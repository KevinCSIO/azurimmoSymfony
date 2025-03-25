<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20250325103751 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE appartement ADD batiment_id INT NOT NULL');
        $this->addSql('ALTER TABLE appartement ADD CONSTRAINT FK_71A6BD8DD6F6891B FOREIGN KEY (batiment_id) REFERENCES batiment (id)');
        $this->addSql('CREATE INDEX IDX_71A6BD8DD6F6891B ON appartement (batiment_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE appartement DROP FOREIGN KEY FK_71A6BD8DD6F6891B');
        $this->addSql('DROP INDEX IDX_71A6BD8DD6F6891B ON appartement');
        $this->addSql('ALTER TABLE appartement DROP batiment_id');
    }
}
