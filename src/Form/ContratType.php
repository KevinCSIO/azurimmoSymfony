<?php

namespace App\Form;

use App\Entity\Appartement;
use App\Entity\Contrat;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ContratType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('dateEntree', null, [
                'widget' => 'single_text',
            ])
            ->add('dateSortie', null, [
                'widget' => 'single_text',
            ])
            ->add('montantLoyer')
            ->add('montantCharges')
            ->add('statut')
            ->add('appartement', EntityType::class, [
                'class' => Appartement::class,
                'choice_label' => 'id',
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Contrat::class,
        ]);
    }
}
