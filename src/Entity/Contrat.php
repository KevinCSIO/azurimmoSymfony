<?php

namespace App\Entity;

use App\Repository\ContratRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ContratRepository::class)]
class Contrat
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $dateEntree = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $dateSortie = null;

    #[ORM\Column]
    private ?float $montantLoyer = null;

    #[ORM\Column]
    private ?float $montantCharges = null;

    #[ORM\Column(length: 255)]
    private ?string $statut = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDateEntree(): ?\DateTimeInterface
    {
        return $this->dateEntree;
    }

    public function setDateEntree(\DateTimeInterface $dateEntree): static
    {
        $this->dateEntree = $dateEntree;

        return $this;
    }

    public function getDateSortie(): ?\DateTimeInterface
    {
        return $this->dateSortie;
    }

    public function setDateSortie(\DateTimeInterface $dateSortie): static
    {
        $this->dateSortie = $dateSortie;

        return $this;
    }

    public function getMontantLoyer(): ?float
    {
        return $this->montantLoyer;
    }

    public function setMontantLoyer(float $montantLoyer): static
    {
        $this->montantLoyer = $montantLoyer;

        return $this;
    }

    public function getMontantCharges(): ?float
    {
        return $this->montantCharges;
    }

    public function setMontantCharges(float $montantCharges): static
    {
        $this->montantCharges = $montantCharges;

        return $this;
    }

    public function getStatut(): ?string
    {
        return $this->statut;
    }

    public function setStatut(string $statut): static
    {
        $this->statut = $statut;

        return $this;
    }
}
