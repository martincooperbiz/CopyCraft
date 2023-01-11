<?php

/**
 * Copyright (c) 2022 Tectalic (https://tectalic.com)
 *
 * For copyright and license information, please view the LICENSE file that was distributed with this source code.
 *
 * Please see the README.md file for usage instructions.
 */
declare (strict_types=1);
namespace OM4\CopyCraft\Vendor\Tectalic\OpenAi\Models\FineTunes;

use OM4\CopyCraft\Vendor\Tectalic\OpenAi\Models\AbstractModel;
final class ListResponseDataItem extends AbstractModel
{
    /**
     * List of required property names.
     *
     * These properties must all be set when this Model is instantiated.
     */
    protected const REQUIRED = ['id', 'object', 'created_at', 'updated_at', 'model', 'fine_tuned_model', 'organization_id', 'status', 'hyperparams', 'training_files', 'validation_files', 'result_files'];
    /** @var string */
    public $id;
    /** @var string */
    public $object;
    /** @var int */
    public $created_at;
    /** @var int */
    public $updated_at;
    /** @var string */
    public $model;
    /** @var string|null */
    public $fine_tuned_model;
    /** @var string */
    public $organization_id;
    /** @var string */
    public $status;
    /** @var \OM4\CopyCraft\Vendor\Tectalic\OpenAi\Models\FineTunes\ListResponseDataItemHyperparams */
    public $hyperparams;
    /** @var \OM4\CopyCraft\Vendor\Tectalic\OpenAi\Models\FineTunes\ListResponseDataItemTrainingFilesItem[] */
    public $training_files;
    /** @var \OM4\CopyCraft\Vendor\Tectalic\OpenAi\Models\FineTunes\ListResponseDataItemValidationFilesItem[] */
    public $validation_files;
    /** @var \OM4\CopyCraft\Vendor\Tectalic\OpenAi\Models\FineTunes\ListResponseDataItemResultFilesItem[] */
    public $result_files;
    /** @var \OM4\CopyCraft\Vendor\Tectalic\OpenAi\Models\FineTunes\ListResponseDataItemEventsItem[] */
    public $events;
}
